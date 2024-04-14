import Foundation

/// デッキ作成ファクトリー
struct DeckCreatorFactory {
    func create(_ type: DeckType) -> IDeckCreator   {

        switch type {
            case .Electric :
                return ElectricDeckCreator()
            case .Fighting :
                return FireDeckCreator()
            case .Fire :
                return FireDeckCreator()
            case .Water :
                return WaterDeckCreator()
            case .Glass :
                return GlassDeckCreator()
        }
    }
}
