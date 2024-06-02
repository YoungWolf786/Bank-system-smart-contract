pragma solidity ^0.8.6;


contract government{


    struct transaction{
        address from;
        address to;
        uint amount;
        uint txid;
    }

    transaction[]  transactionlog;

    function addtransaction(address _from,address _to,uint _amount) external {
        transaction memory _transaction = transaction(_from, _to, _amount, transactionlog.length);
        transactionlog.push(_transaction);
    }

    function gettransaction(uint _index) public view returns (address,address,uint){
        return (transactionlog[_index].from, transactionlog[_index].to, transactionlog[_index].amount);
    }
}