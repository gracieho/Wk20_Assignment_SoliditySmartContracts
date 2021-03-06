pragma solidity ^0.5.0;

// employee one 0xaA712038ee1F0d834E4ef7B3952ABC6C6c4B111d
// employee two 0x4d3EF299f76055eD205c67C99D1be234cBD5D9d9
// employee three 0x97C61599e1289DD05D1E2a2485D5ac18F4D5bDd7

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // ceo gets 60%
    address payable employee_two; // cto gets 25%
    address payable employee_three; // bob gets 15%

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        // Step 2: Add the `amount` to `total` to keep a running total
        // Step 3: Transfer the `amount` to the employee

        // @TODO: Repeat the previous steps for `employee_two` and `employee_three`
        // Your code here!

        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);
        
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);

        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
