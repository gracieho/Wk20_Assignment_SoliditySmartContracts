pragma solidity ^0.5.0;

// lvl 1: equal split
// company address 0x750DF852343ccaF30D4Ddb7d6CBB39e198b6B8b1
// employee_one  0xaA712038ee1F0d834E4ef7B3952ABC6C6c4B111d
// employee_two  0x4d3EF299f76055eD205c67C99D1be234cBD5D9d9
// employee_three  0x97C61599e1289DD05D1E2a2485D5ac18F4D5bDd7

contract AssociateProfitSplitter {
    //address payable owner = msg.sender;
    // Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // check only the owner can call this function
        //require(msg.sender == owner, "You do not have permission to deposit!");
        
        // Split `msg.value` into three
        uint amount = msg.value / 3;

        // Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        // Send any potential remainder by sending back to HR (`msg.sender`)        
        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        // Enforce that the `deposit` function is called in the fallback function!
        deposit ();
    }
}
