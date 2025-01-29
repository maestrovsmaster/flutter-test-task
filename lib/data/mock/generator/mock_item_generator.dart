import 'package:pixelfield_flutter_task/data/models/history_event.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/data/models/tasting_notes.dart';

ItemModel generateMockItem(String id, String name, int year) {
  return ItemModel(
    id: id,
    name: name,
    imageUrl: "https://example.com/image.jpg",
    count: 10,
    total: 100,
    year: year,
    batchNumber: 1234,
    distillery: "Mock Distillery",
    region: "Mock Region",
    country: "Mock Country",
    type: "Whisky",
    ageStatement: "12 years",
    filled: "January 2020",
    bottled: "December 2022",
    caskNumber: "CASK12345",
    abv: 40.0,
    size: "750ml",
    finish: "Sherry",
    videoUrl:
        "https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com",
    officialNotes: TastingNotes(
      nose:
          "A delightful bouquet of sweet and fruity notes, with hints of ripe apples,"
          " juicy peaches, and a subtle touch of tropical mango.",
      palate: "Rich and smooth",
      finish: "Long and warming",
    ),
    userNotes: TastingNotes(
      nose: "Vanilla and oak",
      palate: "Spicy and nutty",
      finish: "Soft and lingering",
    ),
    history: [
      HistoryEvent(
        label: "Event 0",
        title: "Bottled",
        description: "The whisky was bottled in December 2022.",
        attachments: ["https://example.com/attachment1.jpg"],
        dateTime: DateTime(2000, 10, 12),
      ),
      HistoryEvent(
        label: "Event 1",
        title: "Bottled",
        description: "The whisky was bottled in December 2022.",
        attachments: ["https://example.com/attachment1.jpg"],
        dateTime: DateTime(2000, 12, 15),
      ),
      HistoryEvent(
        label: "Event 2",
        title: "Aged",
        description: "Aged for 12 years in oak barrels.",
        attachments: ["https://example.com/attachment2.jpg"],
        dateTime: DateTime(2010, 6, 1),
      ),
      HistoryEvent(
        label: "Event 3",
        title: "Unexpected Journey",
        description:
            "In 2015, during a warehouse renovation, the barrels were accidentally shipped to "
            "a small island off the coast of Scotland. The barrels spent three months on the "
            "island before being rediscovered and returned. Locals claim the salty sea breeze "
            "added a unique flavor to the whisky.",
        attachments: [
          "https://example.com/attachment3.jpg",
          "https://example.com/attachment4.jpg"
        ],
        dateTime: DateTime(2015, 8, 21),
      ),
      HistoryEvent(
        label: "Event 4",
        title: "Auctioned in York",
        description:
            "In 2024, the whisky was sold at an exclusive auction in York."
            "behind this extraordinary spirit.",
        attachments: [
          "https://example.com/auction1.jpg",
          "https://example.com/auction2.jpg"
        ],
        dateTime: DateTime(2024, 6, 15),
      ),
    ],
  );
}
