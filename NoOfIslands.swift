import UIKit
import Foundation

func totalNoOfIslands(inMatrix matrix : [[Int]]) -> Int {
    var totalIslands = 0
    var array = matrix
    for row in 0..<array.count {
        for column in 0..<array[row].count {
            if array[row][column] == 1
            {
                totalIslands = totalIslands + 1
                isIsland(inMatrix: &array, fromRow: row, AndColumn: column)
            }
        }
    }
    return totalIslands
}

func isIsland( inMatrix array : inout [[Int]], fromRow row : Int, AndColumn column : Int)
{
    if  row < 0 || row >= array.count ||
            column < 0 || column >= array[row].count ||
            array[row][column] == 0
    {
        return
    }
    
    array[row][column] = 0
    
    isIsland(inMatrix: &array, fromRow: row-1, AndColumn: column)
    isIsland(inMatrix: &array, fromRow: row+1, AndColumn: column)
    isIsland(inMatrix: &array, fromRow: row, AndColumn: column-1)
    isIsland(inMatrix: &array, fromRow: row, AndColumn: column+1)
    
}

print(totalNoOfIslands(inMatrix: [  [1,1,1,1,0],
                              [1,1,0,1,0],
                              [1,1,0,0,0],
                              [0,0,0,0,0]
             ]))

