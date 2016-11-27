
ExUnit.start()

defmodule EnumsTests do
  use ExUnit.Case, async: true

  @list [1, 2, 3, 4, 5]

  test 'Enums#split empty list' do
    assert Enums.split([], 2) == { [], [] }
  end
  test 'Enums#split at 3' do
    assert { [1, 2, 3], [4, 5] } = Enums.split(@list, 3)
  end
  test 'Enum#split at 0' do
    assert { [], [1, 2, 3, 4, 5] } = Enums.split(@list, 0)
  end
  test 'Enums#split last item' do
    assert { [1, 2, 3, 4], [5] } = Enums.split(@list, 4)
  end
  test 'Enums #split negative -1' do
    assert { [1, 2, 3, 4], [5] } = Enums.split(@list, -1)
  end
end

