// bridges.vala

using GLib;

class BridgesGame{
    int[][] puzzle;
    int size;
    
    construct(int size){
        this.size = size;
        this.puzzle = new int[size][size];
        
        // Initialize the puzzle with zeros
        for(int i = 0; i < size;i++) {
            for(int j = 0; j < size; j++){
                puzzle[i][j] = 0;
            }
        }
    }
    
    void printPuzzle() {
        for(int i = 0: i < size; i ++){
            for(int j = 0; j < size; j++){
                stdout.printf("%2d ", puzzle)[i][j]);
            }
            stdout.printf("\n");
        }
    }
    
    void play(){
        printPuzzle();
    }
}
    void main(string[] args){
        BridesGame game = new Bridesgame(5);
        
        //Start the Game
        game.play();
}

