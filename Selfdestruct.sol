
contract ownable{
     address internal  owner;
    
    modifier onlyowner{
         require(owner == msg.sender,"you are not the owner");
         _;

    }

    constructor(){
        owner = msg.sender;
    }

}
