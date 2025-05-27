// Layout of Contract:
// License Identfier
// version (pragma)
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

//SPDX-License-Identfier: MIT

pragma solidity ^0.8.19;

/**
 * @title A Sample Raffle Contract
 * @author Uday Varma
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRF2.5 for randomness
 */

contract Raffle {
    // This contract is a placeholder for the Raffle functionality.

    /* Errors */
    error Raffle_NotEnoughEthEntered();

    uint256 private immutable i_entranceFee;
    // @dev i_interval is the time interval(in seconds) for the raffle/lottery time period to end.
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp; // @dev i_lastTimeStamp is for the last iteration.
    address payable[] private s_players;

    /* Events */
    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle_NotEnoughEthEntered();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    //1. Get a Random number
    //2. Use the Random Number tp pick a winner
    //3. Be. automatically called
    function pickWinner() external {
        //Check to see f enough time has passed
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
            //Get a Random Number from Chainlink VRF
        }
    }

    /**
     * Getter Functions
     */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
