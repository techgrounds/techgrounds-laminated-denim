import random

# Define valid moves.
def is_valid_move(move):
    valid_moves = ['rock', 'paper', 'scissors']
    return move.lower() in valid_moves or move.lower() in ['r', 'p', 's']

# Define the computer's (random) move.
def get_computer_move():
    moves = ['rock', 'paper', 'scissors']
    return random.choice(moves)

# Define the winner.
def determine_winner(player_move, computer_move):
    if player_move == computer_move:
        return "It's a tie!"
    elif (player_move == 'rock' and computer_move == 'scissors') or \
            (player_move == 'paper' and computer_move == 'rock') or \
            (player_move == 'scissors' and computer_move == 'paper'):
        return "Player wins!"
    else:
        return "Computer wins!"

# Define how a round is played.
def play_round():
    player_move = input("Enter your move (rock, paper, or scissors): ")
    while not is_valid_move(player_move): # Check if input is valid.
        print("Invalid move. Please enter a valid move.")
        player_move = input("Enter your move (rock, paper, or scissors): ")

    computer_move = get_computer_move()
    print("Computer plays:", computer_move)

    winner = determine_winner(player_move.lower(), computer_move)
    print(winner)

    return winner

# Define how the game is played.
def play_game(num_rounds):
    player_score = 0
    computer_score = 0

    for _ in range(num_rounds):
        print("--- New Round ---")
        result = play_round()

        if result == "Player wins!":
            player_score += 1
        elif result == "Computer wins!":
            computer_score += 1

    print("--- Final Scores ---")
    print("Player:", player_score)
    print("Computer:", computer_score)

# Main program
num_rounds = 3  # Change this to set the number of rounds to play
play_game(num_rounds)