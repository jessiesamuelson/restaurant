```
 ____  _____ ____ _____                           _
|  _ \| ____/ ___|_   _|_ _ _   _ _ __ __ _ _ __ | |_
| |_) |  _| \___ \ | |/ _` | | | | '__/ _` | '_ \| __|
|  _ <| |___ ___) || | (_| | |_| | | | (_| | | | | |_
|_| \_\_____|____/ |_|\__,_|\__,_|_|  \__,_|_| |_|\__|

```

---

In the olden days, waitstaff needed to keep track of a party's order by hand...  
But it's the future!  
A client has requested an application to help modernize their restaurant.  
Here is what they wrote:

> I want an application so our waitstaff can manage our food orders.
> 
> Overall, an employee should be able to...
>   * Select a party of customers
>   * Select food items the customers have ordered
>   * Save a receipt
> 
> We'll keep thinking about it over the next few days and send more details when they come up.

##What does this entail?  
**It's up to YOU!**

### Some starting ideas:

#### Food: An item of food on the menu (aka menu item)
* name?
* cuisine type?
* what is the price?
* any allergens?

#### Party: A single group of people
* table number?
* number of guests?
* did they pay yet?

---

**Note:** These routes are just suggestions; You may find that you need more, or that some or unecessary, depending on how you set up your app.

Verb | Route | Action
--- | --- | ---
GET | / | Displays links to navigate the application (including links to each current parties)
GET | /foods | Display a list of food items available
GET | /foods/:id | Display a single food item and a list of all the parties that included it
GET | /foods/new | Display a form for a new food item
POST | /foods | Creates a new food item
GET | /foods/:id/edit | Display a form to edit a food item
PATCH | /foods/:id | Updates a food item
DELETE | /foods/:id | Deletes a food item
GET | /parties | Display a list of all parties
GET | /parties/:id | Display a single party, options for adding a food item to the party and closing the party.
GET | /parties/new | Display a form for a new party
POST | /parties | Creates a new party
GET | /parties/:id/edit | Display a form for to edit a party's details
PATCH | /parties/:id | Updates a party's details
DELETE | /parties/:id | Delete a party
POST | /orders | Creates a new order
PATCH | /orders/:id | Change item to no-charge
DELETE | /orders/:id | Removes an order
GET | /parties/:id/receipt | Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
PATCH | /parties/:id/checkout | Marks the party as paid

---

## Wednesday

**Morning Lecture:** Modules and Concerns

### User Stories
* As an employee, I want to be able to add new food items to the menu.
* As an employee, I want to be able to edit previously added food items, so I can update descriptions or change the price.
* As an employee, I want to be able to delete previously added food items, so I can remove bad or out-of-season food.
* As an employee, I want to be able to add food items to a party as they order them, so I can keep track of a party's orders
* As an employee, I want to be able to create a receipt ... so I can print it out.

---

## Thursday

**Morning Lecture:** Exceptions & Validations 

### User Stories
* As an employee, I want to prevent duplicate food items, so the menu stays clean.
* As an employee, I want the receipt to include 15%, 20%, and 25% tip suggestions, so I can make money.
* As an employee, I want to be able to enter the tip amount when closing a party.
* As an employee, I want to be able to see all my tips today.
* As an employee, I want to be able to make an item "no-charge"... so if they don't like it or it's a friend, I can make it FREE (**bonus challenge**).
* As an employee, I want to be able to see ALL the past receipt data in a single display (**bonus challenge**).

---

## Friday

**Morning Lecture:** Cookies and Session

### User Stories
* As an employee, I want to see an error message if I try to add food to a party that has already paid
* As an employee, I want to be able to use this application on a fullscreen computer...
* As an employee, I want to be able to use this application on a smart phone... (**bonus challenge**)

---

## Weekend

### User Stories
* As an employee, I want to be able to select myself when starting the app, so we can track which waiter had which party.

---