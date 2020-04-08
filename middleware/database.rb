class Database
  USERS = [{ id: 1, name: 'user one' }, { id: 2, name: 'user two' }]

  def get_users(id = nil)
    if id
      USERS.select { |user| user[:id] == id || user['id'] == id }
    else
      USERS
    end
  end

  def add_user(user)
    USERS << user
  end

end