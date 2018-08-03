def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  breed_match_count = []
  for pet in pet_shop[:pets]
    if pet[:breed].downcase() == breed.downcase()
      breed_match_count.push(pet[:breed])
    end
  end
  return breed_match_count
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name].downcase() == pet_name.downcase()
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name].downcase() == pet_name.downcase()
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, pet_to_add)
  pet_shop[:pets].push(pet_to_add)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, pet_to_add)
  customer[:pets].push(pet_to_add)
end

def customer_can_afford_pet(customer, pet_to_buy)
  return false if pet_to_buy == nil
  customer[:cash] >= pet_to_buy[:price]
end

def sell_pet_to_customer(pet_shop, pet_to_sell, customer)
  if customer_can_afford_pet(customer, pet_to_sell)
    add_pet_to_customer(customer, pet_to_sell)
    remove_customer_cash(customer, pet_to_sell[:price])
    remove_pet_by_name(pet_shop, pet_to_sell[:name])
    add_or_remove_cash(pet_shop, pet_to_sell[:price])
    increase_pets_sold(pet_shop, 1)
  end
end
