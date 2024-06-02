pragma solidity ^0.8.6;


import"./ownable.sol";
import"./selfdistruct.sol";


interface goverment {
    function addtransaction(address _from,address _to,uint _amount) external;
}


contract bank is ownable , selfdeestruct{

    govermentInterface govermentinstance = govermentInterface(0xEC5ef95575F1c4A56C7c576F8a18C14B73A7f188);


    mapping (address => uint)  balance;
   

    event balanceAdded(uint amount, address depositedto);
    


    function totalbalance() public view returns (uint) {
        return address(this).balance;

    }

    function deposit() public payable  returns (uint){
        balance[msg.sender] += msg.value;
        emit balanceAdded(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint amount) public returns (uint){
        require(balance[msg.sender] >= amount,"you cannot withdraw more than your balance");
      payable(msg.sender).transfer(amount);
      balance[msg.sender] -= amount;
      return balance[msg.sender];
     // address tosend = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
      //payable (depositedto).transfer(amount);
    }

    function getbalance() public view returns (uint){
        return balance[msg.sender];
    }


    function getowner() public view returns (address){
        return owner;
    }

    function transfer(address recipient, uint amount) public onlyowner {
       
        require(balance[msg.sender] >= amount,"you dont have enough balance to send.");
        require(msg.sender !=recipient,"you are a sender and recipient so the condition is not valid.");
        uint previoussenderbalance = balance[msg.sender];
        balance[msg.sender] -= amount;
        balance[recipient] += amount;

        govermentintance.addtransaction(msg.sender, recipient , amount);

        assert(balance[msg.sender] == previoussenderbalance - amount);
    }
}