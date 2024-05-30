//
//  Scenes .swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 22/5/24.
//

import SwiftUI

struct VistaNoLog: View {
    var body: some View {
        VStack {
            Text("Necesita iniciar sesión para acceder")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}





#Preview {
    VistaNoLog()
}
