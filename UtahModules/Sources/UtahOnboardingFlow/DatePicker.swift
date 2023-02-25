//
// This source file is part of the CardinalKit open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


struct DateOfBirthPicker: View {
    @Binding private var date: Date
    
    private var dateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let startDateComponents = DateComponents(year: 1900, month: 1, day: 1)
        let endDate = Date.now
        
        guard let startDate = calendar.date(from: startDateComponents) else {
            fatalError("Could not translate \(startDateComponents) to a valid date.")
        }
        
        return startDate...endDate
    }
    
    var body: some View {
        DatePicker(
            selection: $date,
            in: dateRange,
            displayedComponents: [
                .date
            ]
        ) { }
            .labelsHidden().datePickerStyle(WheelDatePickerStyle()).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
    
    
    init(date: Binding<Date>, title: String) {
        self._date = date
    }
    
    
    init(date: Binding<Date>) {
        self._date = date
    }
}

#if DEBUG
struct DateOfBirthPicker_Previews: PreviewProvider {
    @State private static var date = Date.now
    
    static var previews: some View {
        VStack {
            DateOfBirthPicker(date: $date)
                .padding(32)
        }
            .background(Color(.systemGroupedBackground))
    }
}
#endif
