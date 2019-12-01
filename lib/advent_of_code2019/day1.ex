defmodule AdventOfCode2019.Day1 do
  @doc """
  Solves a part 1 of the puzzle.

  ## Examples

      iex> AdventOfCode2019.Day1.part1
      3270717

  """
  def part1 do
    "lib/advent_of_code2019/day1.txt"
    |> File.read!()
    |> fuel_requirements_for_all_of_the_modules
  end

  @doc """
  Calculates the sum of the fuel requirements for all of the modules on your spacecraft.

  ## Examples

      iex> AdventOfCode2019.Day1.fuel_requirements_for_all_of_the_modules(\"""
      ...> 12
      ...> 14
      ...> 1969
      ...> 100756
      ...> \""")
      34241

  """
  def fuel_requirements_for_all_of_the_modules(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn mass, acc ->
      mass
      |> String.to_integer()
      |> fuel_requirement_for_module
      |> Kernel.+(acc)
    end)
  end

  defp fuel_requirement_for_module(mass) when is_integer(mass) do
    trunc(mass / 3) - 2
  end
end
