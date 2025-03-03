program auction.aleo;

record Bid:
    owner as address.private;
    bidder as address.private;
    amount as u64.private;
    is_winner as boolean.private;

function place_bid:
    input r0 as u64.private;
    cast aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l self.caller r0 false into r1 as Bid.record;
    output r1 as Bid.record;

function resolve:
    input r0 as Bid.record;
    input r1 as Bid.record;
    is.eq self.caller aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l into r2;
    assert.eq r2 true;
    gte r0.amount r1.amount into r3;
    not r3 into r4;
    ternary r3 r0.owner r1.owner into r5;
    ternary r3 r0.bidder r1.bidder into r6;
    ternary r3 r0.amount r1.amount into r7;
    ternary r3 r0.is_winner r1.is_winner into r8;
    cast r5 r6 r7 r8 into r9 as Bid.record;
    output r9 as Bid.record;

function finish:
    input r0 as Bid.record;
    is.eq self.caller aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l into r1;
    assert.eq r1 true;
    cast aleo15e5pm44u46vl06ymqz0qnynvawkjgapl63kpx2tlt5mncffay58q5v858l r0.bidder r0.amount true into r2 as Bid.record;
    output r2 as Bid.record;
