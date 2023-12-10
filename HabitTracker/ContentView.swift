//
//  ContentView.swift
//  HabitTracker
//
//  Created by Dominique Strachan on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.activities, id: \.self) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            
                            Spacer()
                            
                            Text(String(activity.completionCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .foregroundColor(.white)
                                .clipShape(.capsule)
                        }
                    }
                }
                .onDelete(perform: removeRows)
                
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            .red
            // return .red
        } else if activity.completionCount < 10 {
            .orange
            // return .orange
        } else if activity.completionCount < 20 {
            .yellow
            // return .yellow
        } else if activity.completionCount < 50 {
            .green
            // return .green
        } else {
            .blue
            // return .blue
        }
    }
}

#Preview {
    ContentView()
}


//struct ContentView: View {
//    @State private var data = Activities()
//    @State private var addingNewActivity = false
//    
//    var body: some View {
//        NavigationStack {
//            List(data.activities) { activity in
//                NavigationLink {
//                    ActivityView(data: data, activity: activity)
//                } label: {
//                    HStack {
//                        Text(activity.title)
//                        
//                        Spacer()
//                        
//                        Text(String(activity.completionCount))
//                            .font(.caption.weight(.black))
//                            .padding(5)
//                            .frame(minWidth: 50)
//                            .background(color(for: activity))
//                            .foregroundColor(.white)
//                            .clipShape(.capsule)
//                    }
//                }
//                
//            }
//            .navigationTitle("Habit Tracker")
//            .toolbar {
//                Button("Add new activity", systemImage: "plus") {
//                    addingNewActivity.toggle()
//                }
//            }
//            .sheet(isPresented: $addingNewActivity) {
//                AddActivity(data: data)
//            }
//        }
//    }
//    
//    func removeRows(at offsets: IndexSet) {
//        data.activities.remove(atOffsets: offsets)
//    }
//    
//    func color(for activity: Activity) -> Color {
//        if activity.completionCount < 3 {
//            .red
//           // return .red
//        } else if activity.completionCount < 10 {
//            .orange
//           // return .orange
//        } else if activity.completionCount < 20 {
//            .yellow
//           // return .yellow
//        } else if activity.completionCount < 50 {
//            .green
//           // return .green
//        } else {
//            .blue
//           // return .blue
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
