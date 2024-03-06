import ollama
 
# Initialize the model
model = ollama.Model("gpt-2")
 
# Run the model
model.run()
 
# Chatbot loop
while True:
    user_input = input("You: ")
    if user_input.lower() == "quit":
        break
    
    # Make inference
    response = model.predict(user_input)
    
    print(f"Chatbot: {response}")
