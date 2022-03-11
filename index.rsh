"reach 0.1";

const Player = {
  getHand: Fun([], UInt),
  seeOutcome: Fun([UInt], Null),
};

export const main = Reach.App(() => {
  const Alice = Participant("Alice", {
    ...Player,
  });
  const Bob = Participant("Bob", {
    ...Player,
  });
  init();

  Alice.only(() => {
    const handAlice = declassify(interact.getHand());
  });
  Alice.publish(handAlice);
  commit();

  each([Alice, Bob], () => {
    interact.seeOutcome(outcome);
  });

  exit();
});
