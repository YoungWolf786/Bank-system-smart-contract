pragma solidity ^0.7.6;


contract kill{
    function killme() public {
        selfdestruct (payable (msg.sender));

    }
}
