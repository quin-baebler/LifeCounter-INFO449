import SwiftUI


struct ContentView: View {

  @State private var player1Life = 20
  @State private var player2Life = 20
  @State private var winner: String? = nil
  var body: some View {
    VStack {
      HStack {
        Text("Player 1")
        Spacer()
        Text(String(player1Life))
      }
      .padding()

      HStack {
        Button {
          player1Life += 1
        } label: {
          Text("+")
        }
        .padding()

        Button {
          player1Life -= 1
          player1Life = max(player1Life, 0)
          checkWinner()
        } label: {
          Text("-")
        }
        .padding()

        Button {
          player1Life += 5
        } label: {
          Text("+5")
        }
        .padding()

        Button {
          player1Life -= 5
          player1Life = max(player1Life, 0)
          checkWinner()
        } label: {
          Text("-5")
        }
        .padding()
      }

      Spacer()

      HStack {
        Text("Player 2")
        Spacer()
        Text(String(player2Life))
      }
      .padding()

      HStack {
        Button {
          player2Life += 1
        } label: {
          Text("+")
        }
        .padding()

        Button {
          player2Life -= 1
          player2Life = max(player2Life, 0)
          checkWinner()
        } label: {
          Text("-")
        }
        .padding()

        Button {
          player2Life += 5
        } label: {
          Text("+5")
        }
        .padding()

        Button {
          player2Life -= 5
          player2Life = max(player2Life, 0)
          checkWinner()
        } label: {
          Text("-5")
        }
        .padding()
      }

      Spacer()

      if let winner = winner {
        Text(winner)
          .font(.title)
          .foregroundColor(.red)
      }

    }
  }
  func checkWinner() {
    if player1Life == 0 {
      winner = "Player 1 LOSES!"
    } else if player2Life == 0 {
      winner = "Player 2 LOSES!"
    }
  }
}

#Preview {
  ContentView()
}
