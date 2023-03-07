class Book {
  final String title;
  final List<String> authors;
  final String isbn;
  final String location;
  final String condition;
  final String description;
  final List<String> categories;
  final String coverImage;

  Book(
    this.title,
    this.authors,
    this.isbn,
    this.location,
    this.condition,
    this.description,
    this.categories,
    this.coverImage,
  );
}

List<Book> books = [
  Book(
      "The Lord of the Rings",
      ["J. R. R. Tolkien"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "Lord of the Rings is an epic high-fantasy novel by English author and scholar J. R. R. Tolkien. Set in Middle-earth, the story began as a sequel to Tolkien's 1937 children's book The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling books ever written, with over 150 million copies sold.\nThe title refers to the story's main antagonist, the Dark Lord Sauron, who, in an earlier age, created the One Ring to rule the other Rings of Power given to Men, Dwarves, and Elves, in his campaign to conquer all of Middle-earth. From homely beginnings in the Shire, a hobbit land reminiscent of the English countryside, the story ranges across Middle-earth, following the quest to destroy the One Ring, seen mainly through the eyes of the hobbits Frodo, Sam, Merry and Pippin.",
      ["fiction"],
      "assets/images/lotr_ci.jpg"),
  Book(
      "Dear Reader: The Unauthorized Autobiography of Kim Jong II",
      ["Michael Malice"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "No country is as misunderstood as North Korea, and no modern tyrant has remained more mysterious than the Dear Leader, Kim Jong Il. Now, celebrity ghostwriter Michael Malice pulls back the curtain to expose the life story of the Incarnation of Love and Morality. Taken directly from books spirited out of Pyongyang, DEAR READER is a carefully reconstructed first-person account of the man behind the mythology.\nFrom his miraculous rainbow-filled birth during the fiery conflict of World War II, Kim Jong II watched as his beloved Korea finally earned its freedom from the cursed Japanese. Mere years later, the wicked US imperialists took their chance at conquering the liberated nation—with devastating results. But thats only the beginning of the Dear Leaders story.",
      ["biography"],
      "assets/images/kj_ci.jpg"),
  Book(
      "Fire & Blood",
      ["George R. R. Martin"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "Fire & Blood is a fantasy book by American writer George R. R. Martin and illustrated by Doug Wheatley. It tells the history of House Targaryen, the dynasty that ruled the Seven Kingdoms of Westeros in the backstory of his series A Song of Ice and Fire. Although originally planned for publication after the completion of the series, Martin has revealed his intent to publish the history in two volumes as the material had grown too large. The first volume was released on November 20, 2018.\nThe second half of this first volume (an expanded version of The Princess and the Queen) has been adapted into the HBO series House of the Dragon, a prequel to Game of Thrones.",
      ["fiction"],
      "assets/images/fnb_ci.jpg"),
  Book(
      "Harry Potter and the Philosopher's Stone",
      ["J. K. Rowling"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "Harry Potter and the Philosopher's Stone is a 1997 fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling's debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry. Harry makes close friends and a few enemies during his first year at the school and with the help of his friends, Ron Weasley and Hermione Granger, he faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry's parents, but failed to kill Harry when he was just 15 months old.",
      ["fiction"],
      "assets/images/hp1_ci.jpg"),
  Book(
      "The Hobbit",
      ["J. R. R. Tolkien"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "The Hobbit, or There and Back Again is a children's fantasy novel by English author J. R. R. Tolkien. It was published in 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction. The book remains popular and is recognized as a classic in children's literature. \nThe Hobbit is set within Tolkien's fictional universe and follows the quest of home-loving Bilbo Baggins, the titular hobbit, to win a share of the treasure guarded by a dragon named Smaug. Bilbos journey takes him from his light-hearted, rural surroundings into more sinister territory.",
      ["fiction"],
      "assets/images/hobbit_ci.jpg"),
  Book(
      "A Game of Thrones",
      ["George R. R. Martin"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "A Game of Thrones is the first novel in A Song of Ice and Fire, a series of fantasy novels by American author George R. R. Martin. It was first published on August 1, 1996. The novel won the 1997 Locus Award and was nominated for both the 1997 Nebula Award and the 1997 World Fantasy Award. The novella Blood of the Dragon, comprising the Daenerys Targaryen chapters from the novel, won the 1997 Hugo Award for Best Novella. In January 2011, the novel became a New York Times Bestseller and reached No. 1 on the list in July 2011.\nIn the novel, recounting events from various points of view, Martin introduces the plot-lines of the noble houses of Westeros, the Wall, and the Targaryens. The novel has inspired several spin-off works, including several games. It is also the namesake and basis for the first season of Game of Thrones, an HBO television series that premiered in April 2011. A paperback TV tie-in re-edition was published in March 2013, titled Game of Thrones.",
      ["fiction"],
      "assets/images/got_ci.jpg"),
  Book(
      "Harry Potter and the Deathly Hallows",
      ["J. K. Rowling"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "Harry Potter and the Deathly Hallows is a fantasy novel written by British author J. K. Rowling and the seventh and final novel of the main Harry Potter series. It was released on 21 July 2007 in the United Kingdom by Bloomsbury Publishing, in the United States by Scholastic, and in Canada by Raincoast Books. The novel chronicles the events directly following Harry Potter and the Half-Blood Prince (2005) and the final confrontation between the wizards Harry Potter and Lord Voldemort.",
      ["fiction"],
      "assets/images/hp2_ci.jpg"),
  Book(
      "Mein Kampf",
      ["Adolf Hitler"],
      "tmp_isbn",
      "Mumbai, Maharashtra",
      "Good",
      "Mein Kampf (German: [mein kampf]; lit. My Struggle') is a 1925 autobiographical manifesto by Nazi Party leader Adolf Hitler. The work describes the process by which Hitler became antisemitic and outlines his political ideology and future plans for Germany. Volume 1 of Mein Kampf was published in 1925 and Volume 2 in 1926 The book was edited first by Emil Maurice, then by Hitler's deputy Rudolf Hess. \nHitler began Mein Kampf while imprisoned following his failed coup in Munich in November 1923 and a trial in February 1924 for high treason, in which he received a sentence of five years. Although he received many visitors initially, he soon devoted himself entirely to the book. As he continued, he realized that it would have to be a two-volume work, with the first volume scheduled for release in early 1925. The governor of Landsberg noted at the time that he [Hitler] hopes the book will run into many editions, thus enabling him to fulfill his financial obligations and to defray the expenses incurred at the time of his trial. After slow initial sales, the book became a bestseller in Germany following Hitlers rise to power in 1933.",
      ["biography"],
      "assets/images/mf_ci.webp"),
];
