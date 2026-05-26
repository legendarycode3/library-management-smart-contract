// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


/**
 * @title   Library Management 
 * @author  LegendaryCode
 * @notice  A smart contract that Register books, set their availability, and update status.Simply a streamlined smart contract for managing a library's book registry and availability status.
 * @dev Implements strict access control (owner-only) and state tracking for books.
 */





contract LibrayManagement {

                /** TYPE DECLARATIONS */
    struct Book {
        uint256 bookId;
        string title;
        string author;
        bool isAvailable;
        bool exists;
    }  

    enum BookStatus {
        Available   
    }


                /** STATE VARIABLES */
    mapping(uint256 => Book) public s_bookRegistry;
    
    uint256 public s_booksCount; 

    address public immutable i_owner;

    BookStatus private s_bookState;  



                /** EVENTS */
    event BookRegistered(uint256 indexed bookId, string  title, string  author);
    event BookStatusToggled(uint256 indexed id, bool isAvialable);
 


                /** ERRORS */
    error Book__OnlyOwner();
    error Book_AlreadyAdded(uint256 bookId);
    error Book__DoesNotExist(uint256 bookId);



                /** MODIFIERS */
    
    ///  @notice Restricts function execution to the contract owner.
    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert Book__OnlyOwner();
        }
        _;
    }



                /** FUNCTIONS */
    /// @notice Initializes the contract, setting the deploying address as the owner.
    constructor ()  {
        i_owner = msg.sender;
    }


     /**
     * @notice Registers a new book into the library registry.
     * @dev Can only be called by the contract owner. Checks if the book ID already exists.
     * @param _bookId The unique identifier for the book.
     * @param _title The title of the book.
     * @param _author The author of the book.
     */
    function addBook(uint256 _bookId, string memory _title, string memory _author ) public onlyOwner {
        // Checks if a Book already exist or 
       
        if (s_bookRegistry[_bookId].exists ) {
            revert Book_AlreadyAdded(_bookId);
        }

        s_bookRegistry[_bookId] = Book(_bookId, _title, _author, true, true);

         s_booksCount = s_booksCount + 1;

        emit BookRegistered(_bookId, _title, _author);
    }



     /**
     * @notice Toggles the availability status of an existing book.
     * @dev Reverts if the book does not exist in the registry. 
     * @param _bookId The unique identifier for the book to toggle.
     */
    function toggleBookAvailable(uint256 _bookId) public  {

        if (!s_bookRegistry[_bookId].exists) {
            revert Book__DoesNotExist(_bookId);
        }

         Book storage book = s_bookRegistry[_bookId];

         book.isAvailable = !book.isAvailable;

        emit BookStatusToggled(_bookId, book.isAvailable);
    }

}









