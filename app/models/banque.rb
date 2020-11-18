class Banque < ApplicationRecord

  belongs_to :user


  def self.solde_graph

    find_by_sql(<<-SQL
      SELECT
        banque_name,
        sum(solde) as solde, sum(restant_a_tirer) as restant_a_tirer
      FROM banques
      GROUP BY banque_name
      ORDER BY solde
      SQL

    ).map do |row|
      [
        row['banque_name'],
        row.solde.to_i,
        row.restant_a_tirer.to_i
      ]
    end
  end

end
