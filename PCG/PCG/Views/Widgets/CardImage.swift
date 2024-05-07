import SwiftUI

struct CardImage: View {
    
    /// サイズ
    enum Size {
        case Normal, Small
    }
    
    /// 画像番号
    var cardNo: String
    
    /// サイズ
    var size: Size
    
    // 幅
    var width: CGFloat {
        return size == .Normal ? 90 : 60
    }
    
    // 高さ
    var height: CGFloat {
        return size == .Normal ? 120: 80
    }
    
    
    var body: some View {
        Image(cardNo)
            .resizable()
            .frame(width: width, height: height)
    }
}

#Preview {
    CardImage(cardNo: "037479", size: .Normal)
}
