pragma solidity ^0.4.16;

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

contract ZazToken {
    // Public variables of the token
    string public name = &quot;ZAZ TOKEN&quot;;
    string public symbol = &quot;ZTZ&quot;;
    uint8 public decimals = 0;
    // 18 decimals is the strongly suggested default
    uint256 public totalSupply;
    uint256 public zazSupply = 20000000;
    uint256 public price ;
    address public creator;
    // This creates an array with all balances
    mapping (address =&gt; uint256) public balanceOf;
    mapping (address =&gt; mapping (address =&gt; uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
    event Transfer(address indexed from, address indexed to, uint256 value);
    event FundTransfer(address backer, uint amount, bool isContribution);
    
    
    /**
     * Constrctor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    function ZazToken() public {
        totalSupply = zazSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;    // Give ZazToken Mint the total created tokens
        creator = msg.sender;
    }
    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(balanceOf[_from] &gt;= _value);
        // Check for overflows
        require(balanceOf[_to] + _value &gt;= balanceOf[_to]);
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
      
    }

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    
    
    /// @notice Buy tokens from contract by sending ether
    function () payable internal {
        
        if (price &gt;= 0 ether &amp;&amp; price &lt; 0.005 ether){
        uint ammount = 500;                  // calculates the amount, made it so you can get many ZazMinth but to get MANY ZazToken you have to spend ETH and not WEI
        uint ammountRaised;                                     
        amountRaised += msg.value;                            //many thanks Zaz, couldnt do it without r/me_irl
        require(balanceOf[creator] &gt;= ammount);               // checks if it has enough to sell
        require(msg.value &lt; 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += ammount;                  // adds the amount to buyer&#39;s balance
        balanceOf[creator] -= ammount;                        // sends ETH to ZazMinth
        Transfer(creator, msg.sender, ammount);               // execute an event reflecting the change
        creator.transfer(ammountRaised);
        }
        if (price &gt;= 0.005 ether &amp;&amp; price &lt; 0.03 ether){
        uint amount = 2000;                  // calculates the amount, made it so you can get many ZazToken but to get MANY ZazToken you have to spend ETH and not WEI
        uint amountRaised;                                     
        amountRaised += msg.value;                            //many thanks zaz, couldnt do it without r/me_irl
        require(balanceOf[creator] &gt;= amount);               // checks if it has enough to sell
        require(msg.value &lt; 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer&#39;s balance
        balanceOf[creator] -= amount;                        // sends ETH to ZazMinth
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
        }
         if (price &gt;= 0.03 ether){
        uint amnount = 10000;                  // calculates the amount, made it so you can get many ZazToken but to get MANY  you have to spend ETH and not WEI
        uint amnountRaised;                                     
        amountRaised += msg.value;                            //many thanks Zaz, couldnt do it without r/me_irl
        require(balanceOf[creator] &gt;= amnount);               // checks if it has enough to sell
        require(msg.value &lt; 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amnount;                  // adds the amount to buyer&#39;s balance
        balanceOf[creator] -= amnount;                        // sends ETH to ZazMinth
        Transfer(creator, msg.sender, amnount);               // execute an event reflecting the change
        creator.transfer(amnountRaised);
        }
    }

 }