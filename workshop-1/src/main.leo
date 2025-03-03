program auction.aleo {

    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool
    }

    const AUCTIONEER: address = aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l;
    const OWNER: address = aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l;

    transition place_bid(amount: u64) -> Bid {
        return Bid {
            owner: OWNER,
            bidder: self.caller,
            amount: amount,
            is_winner: false
        };
    }

    transition resolve(bid1: Bid, bid2: Bid) -> Bid {
        assert(self.caller == AUCTIONEER);

        if (bid1.amount >= bid2.amount) {
            return bid1;
        } else {
            return bid2;
        }
    }

    transition finish(winning_bid: Bid) -> Bid {
        assert(self.caller == AUCTIONEER);
    
        return Bid {
            owner: OWNER,
            bidder: winning_bid.bidder,
            amount: winning_bid.amount,
            is_winner: true
        };
    }
}