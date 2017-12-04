class BeanCounting
  def initialize(beans)
    @rawBeans = beans
  end

  def count_beans(type)
    @rawBeans.count(type)
  end

  def submit_guesses(guesses)
  end

  def get_reward(player)
  end

  def get_reward_list
  end
end
