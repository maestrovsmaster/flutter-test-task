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
    videoUrl: "https://example.com/video.mp4",
    officialNotes: TastingNotes(
      nose: "Sweet and fruity",
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
        label: "Event 1",
        title: "Bottled",
        description: "The whisky was bottled in December 2022.",
        attachments: ["https://example.com/attachment1.jpg"],
      ),
      HistoryEvent(
        label: "Event 2",
        title: "Aged",
        description: "Aged for 12 years in oak barrels.",
        attachments: ["https://example.com/attachment2.jpg"],
      ),
    ],
  );
}
