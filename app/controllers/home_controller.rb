class HomeController < ApplicationController
  def index
    render json: { on_duty: weeks_2023 }
  end

  private

  def cleaning_groups
    [
      {
        id: 1,
        group: 'Hellen, Kenny y Ramon'
      },
      {
        id: 2,
        group: 'Loa, Arlim, Fabian + alguien q los apoye?'
      },
      {
        id: 3,
        group: 'Brayan, Mayu y Hector o Adri'
      },
      {
        id: 4,
        group: 'Chino, Jislen y Ezequiel '
      },
      {
        id: 5,
        group: 'Martita, Candy y Shirley'
      }
    ]
  end

  def prayer_groups
    [
      {
        id: 1,
        group: 'Candy y Vilma'
      },
      {
        id: 2,
        group: 'Shirley'
      },
      {
        id: 3,
        group: 'Hector y Adri'
      },
      {
        id: 4,
        group: 'Kenny y Hellen'
      },
      {
        id: 5,
        group: 'Rosario y Martita'
      },
      {
        id: 6,
        group: 'Rosario y Martita'
      }
    ]
  end

  def weeks_2023
    today = Date.new(2023, 6, 1)
    end_of_year = Date.new(today.year, 12, 31)

    week_labor = {}
    current_date = today
    cleaning_group = 1
    pray_group = 1
    while current_date <= end_of_year
      week_number = current_date.cweek

      clean_team = cleaning_groups.detect { |group| group[:id] == cleaning_group }[:group]
      pray_team = prayer_groups.detect { |group| group[:id] == pray_group }[:group]

      week_labor[week_number] = {
        clean_team: ,
        pray_team:
      }

      current_date += 7
      cleaning_group += 1
      pray_group += 1

      cleaning_group = 1 if cleaning_group > cleaning_groups.size
      pray_group = 1 if pray_group > prayer_groups.size
    end

    week_labor
  end
end
