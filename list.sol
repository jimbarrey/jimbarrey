contract ERC721WithSale is ERC721, Ownable {
  uint256 public totalSupply;

  struct Sale {
    bool isForSale;
    uint256 tokenId;
    address seller;
    uint256 price;
  }
  
  // Method 1: return Sale[]
  function getOnSaleMap(uint256 start, uint256 end) public view 
    returns (Sale[] memory sales) {
    
    uint256 count = 0;
    for (uint tokenId = start; tokenId < end; tokenId++) {
      if (tokensForSale[tokenId].isForSale) {
        count++;
      }
    }

    Sale[] memory _sales = new Sale[](count);

    count = 0;
    for (uint tokenId = start; tokenId < end; tokenId++) {
      if (tokensForSale[tokenId].isForSale) {
        _sales[count] = tokensForSale[tokenId];
        count++;
      }
    }
    
    return _sales;
  }
  
  // Method 2: return 3 arrays with the needed info
  function getOnSaleTokenIds(uint256 start, uint256 end) public view 
    returns (uint256[] memory tokenIds, address[] memory sellers, uint256[] memory prices) {

    uint256 count = 0;
    for (uint i = start; i < end; i++) {
      if (tokensForSale[i].isForSale) {
        count++;
      }
    }

    uint256[] memory onSaleTokenIds = new uint[](count);
    address[] memory _sellers = new address[](count);
    uint256[] memory _prices = new uint256[](count);

    uint256 counter = 0;
    for (uint i = start; i < end; i++) {
      if (tokensForSale[i].isForSale) {
        onSaleTokenIds[counter] = i;
        _sellers[counter] = tokensForSale[i].seller;
        _prices[counter] = tokensForSale[i].price;
        counter++;
      }
    }

    return (onSaleTokenIds, _sellers, _prices);
  }
}


  
  
