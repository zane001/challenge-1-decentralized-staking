// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;  //Do not change the solidity version as it negativly impacts submission grading

contract ExampleExternalContract {

    bool public completed;
    address private resetAddress;

    function complete() public payable {
        resetAddress = msg.sender;
        completed = true;
    }

    function reset() public {
        require(
            msg.sender == resetAddress,
            "Only completing address can reset."
        );
        completed = false;
        (bool sent, bytes memory data) = resetAddress.call{
        value : address(this).balance
        }("");
        require(sent, "Failed to send Ether");
    }

}
