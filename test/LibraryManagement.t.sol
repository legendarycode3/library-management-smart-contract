// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {LibrayManagement} from "../src/LibraryManagement.sol";


contract LibrayManagementTest is Test{

    LibrayManagement libr;

    address public owner = makeAddr("owner");
     address public user = makeAddr("user");


    uint256 constant BOOK_ID = 1;
    string constant TITLE = "Solidity";
    string constant AUTHOR = " Williams";


    function setUp() public {
        libr = new LibrayManagement();
    }




    /*//////////////////////////////////////////////////////////////
                            CONSTRUCTOR TESTS
    //////////////////////////////////////////////////////////////*/

    function testOwnerIsSetCorrectly() public {
        assertEq(libr.i_owner(), owner);
    }



     /*//////////////////////////////////////////////////////////////
                              ADD BOOK TESTS
    //////////////////////////////////////////////////////////////*/

    function testAddBookSuccessfully() public {

        // Adding book
        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );


          // Assert after adding
        (
            uint256 bookId,
            string memory title,
            string memory author,
            bool isAvailable,
            bool exists
        ) = libr.s_bookRegistry(BOOK_ID);


        assertEq(bookId, BOOK_ID);
        assertEq(title, TITLE);
        assertEq(author, AUTHOR);
        assertEq(isAvailable, true);
        assertEq(exists, true);

        assertEq(libr.s_booksCount(), 1);
    }


    function testEmitEventWhenBookIsAdded() public {

        vm.expectEmit(true, false, false, true);

        emit LibrayManagement.BookRegistered(
            BOOK_ID,
            TITLE,
            AUTHOR
        );

        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );
    }


     function testRevertIfNonOwnerAddsBook() public {

        vm.prank(user);

        vm.expectRevert(
            LibrayManagement.Book__OnlyOwner.selector
        );

        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );
    }



     /*//////////////////////////////////////////////////////////////
                        TOGGLE BOOK STATUS TESTS
    //////////////////////////////////////////////////////////////*/

    function testToggleBookAvailability() public {

        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );

        libr.toggleBookAvailable(BOOK_ID);

        (
            ,
            ,
            ,
            bool isAvailable,

        ) = libr.s_bookRegistry(BOOK_ID);

        assertEq(isAvailable, false);
    }


    function testToggleBookAvailabilityTwice() public {

        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );

        libr.toggleBookAvailable(BOOK_ID);

        libr.toggleBookAvailable(BOOK_ID);

        (
            ,
            ,
            ,
            bool isAvailable,

        ) = libr.s_bookRegistry(BOOK_ID);

        assertEq(isAvailable, true);
    }


    function testEmitEventWhenAvailabilityChanges() public {

        libr.addBook(
            BOOK_ID,
            TITLE,
            AUTHOR
        );

        vm.expectEmit(true, false, false, true);

        emit LibrayManagement.BookStatusToggled(
            BOOK_ID,
            false
        );

        libr.toggleBookAvailable(BOOK_ID);
    }

    function testRevertIfBookDoesNotExist() public {

        vm.expectRevert(
            abi.encodeWithSelector(
                LibrayManagement.Book__DoesNotExist.selector,
                BOOK_ID
            )
        );

        libr.toggleBookAvailable(BOOK_ID);
    }

}
