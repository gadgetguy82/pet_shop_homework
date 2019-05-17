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

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pet_list = []
  for pet in pet_shop[:pets]
    if (pet[:breed] == breed)
      pet_list.push(pet)
    end
  end
  return pet_list
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if (pet[:name] == name)
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if (pet[:name] == name)
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  price = pet[:price]
  if (customer_can_afford_pet(customer, pet))
    remove_customer_cash(customer, price)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    add_or_remove_cash(pet_shop, price)
    increase_pets_sold(pet_shop, 1)
  end
end
