import SwiftUI

struct PlayMat: View {
    
    let ballColor: Color
    
    let isMine: Bool
    
    var fromTrim: CGFloat {
        return isMine ? 0 : 0.5
    }
    
    var toTrim: CGFloat {
        return isMine ? 0.5 : 1
    }
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: fromTrim, to: toTrim)
                .foregroundStyle(Color(red: 252/255, green: 113/255, blue: 110/255).gradient.opacity(0.9))
                .frame(width: UIScreen.main.bounds.width + 300)
            Circle()
                .trim(from: fromTrim, to: toTrim)
                .stroke(
                    ballColor,
                    style: StrokeStyle(lineWidth: 4)
                )
                .frame(width: UIScreen.main.bounds.width + 280)
            Circle()
                .trim(from: fromTrim, to: toTrim)
                .foregroundStyle(ballColor.gradient.opacity(0.9))
                .frame(width: UIScreen.main.bounds.width + 200)
            Circle()
                .trim(from: fromTrim, to: toTrim)
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 15)
                )
                .frame(width: UIScreen.main.bounds.width + 150)
            Circle()
                .trim(from: fromTrim, to: toTrim)
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 50)
                )
                .frame(width: UIScreen.main.bounds.width / 2)
        }
    }
}
