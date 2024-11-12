class CarRentalChatbot:
    def __init__(self):
        self.preferences = {}

    def greet(self):
        print("Welcome to our car rental service! I can help you find the perfect rental car.")

    def ask_preferences(self):
        print("Let's start by asking a few questions to understand your preferences.")

        self.preferences['location'] = input("Where would you like to pick up the car from? ")
        self.preferences['pickup_date'] = input("When do you want to pick up the car? (YYYY-MM-DD) ")
        self.preferences['return_date'] = input("When will you return the car? (YYYY-MM-DD) ")
        self.preferences['car_type'] = input("What type of car are you looking for? (e.g., sedan, SUV) ")

        # Handle budget input
        while True:
            try:
                budget_input = input("What is your budget for the rental? ")
                self.preferences['budget'] = float(budget_input.replace('$', ''))
                break
            except ValueError:
                print("Invalid input. Please enter a valid number for the budget.")

        self.preferences['fuel_efficiency'] = input("Do you have any preference for fuel efficiency? (e.g., high, medium, low) ")
        self.preferences['features'] = input("Are there any specific features you'd like in the car? (e.g., GPS, Bluetooth) ")
        self.preferences['requirements'] = input("Do you have any other specific requirements? ")

    def suggest_cars(self):
        print("\nBased on your preferences, here are some options:")
        if self.preferences['car_type'].lower() == 'sedan':
            print("1. Sedan - Toyota Camry - $400")
            print("2. Sedan - Honda Accord - $420")
            print("3. Sedan - Ford Fusion - $380")
            print("4. Sedan - Nissan Altima - $410")
        elif self.preferences['car_type'].lower() == 'suv':
            print("1. SUV - Toyota RAV4 - $450")
            print("2. SUV - Ford Explorer - $480")
            print("3. SUV - Chevrolet Tahoe - $520")
            print("4. SUV - Jeep Grand Cherokee - $490")
        else:
            print("We currently only offer sedan and SUV rentals.")

    def confirm_choice(self):
        choice = input("\nWhich car would you like to rent? (Enter the number) ")
        if self.preferences['car_type'].lower() == 'sedan':
            if choice == '1':
                self.preferences['car_choice'] = "Toyota Camry"
            elif choice == '2':
                self.preferences['car_choice'] = "Honda Accord"
            elif choice == '3':
                self.preferences['car_choice'] = "Ford Fusion"
            elif choice == '4':
                self.preferences['car_choice'] = "Nissan Altima"
            else:
                print("Invalid choice.")
                self.confirm_choice()
        elif self.preferences['car_type'].lower() == 'suv':
            if choice == '1':
                self.preferences['car_choice'] = "Toyota RAV4"
            elif choice == '2':
                self.preferences['car_choice'] = "Ford Explorer"
            elif choice == '3':
                self.preferences['car_choice'] = "Chevrolet Tahoe"
            elif choice == '4':
                self.preferences['car_choice'] = "Jeep Grand Cherokee"
            else:
                print("Invalid choice.")
                self.confirm_choice()

    def finalize_booking(self):
        print(f"\nGreat choice! Let me finalize your booking for {self.preferences['car_choice']}.")
        # In a real implementation, this would finalize the booking and provide confirmation details

    def chat(self):
        self.greet()
        self.ask_preferences()
        self.suggest_cars()
        self.confirm_choice()
        self.finalize_booking()
        print("Thank you for using our car rental service!")

# Main function
def main():
    chatbot = CarRentalChatbot()
    chatbot.chat()

if __name__ == "__main__":
    main()
