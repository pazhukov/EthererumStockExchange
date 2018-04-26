pragma solidity ^0.4.21;

contract StockExchange {
    
    struct Trade {
       bytes6 asset; 
       int direction;
       int qty;
       int amount;
       bytes10 owner;
       bytes10 timestamp;
    }    
    
    int8 trade_uid;
    
    mapping (int8 => Trade) trades;
    
    function getUID() view public returns (int8 uid) {
        return trade_uid;
    }
    
    function addTradeBuy(bytes6 _asset, int _qty, int _amount, bytes10 _owner, bytes10 _timestamp) public {

        trade_uid = trade_uid + 1;
        
        Trade memory _trade = Trade(_asset, 0, _qty, _amount, _owner, _timestamp);
        
        trades[trade_uid] = _trade;
    } 
    
    function addTradeSell(bytes6 _asset, int _qty, int _amount, bytes10 _owner, bytes10 _timestamp) public {

        trade_uid = trade_uid + 1;
        
        Trade memory _trade = Trade(_asset, 1, _qty, _amount, _owner, _timestamp);
        
        trades[trade_uid] = _trade;
    }     
    
    function getTrade(int8 uid) view public returns (bytes6 _asset, int _direction, int _qty, int _amount, bytes10 _owner, bytes10 _timestamp) {
        return (trades[uid].asset, trades[uid].direction, trades[uid].qty, trades[uid].amount, trades[uid].owner, trades[uid].timestamp);
    }
    
}