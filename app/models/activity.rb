class Activity < ActiveRecord::Base
	has_and_belongs_to_many :speakers
	has_and_belongs_to_many :users
	belongs_to :edition

	def self.next_activity(activities)
		activities.select { |a| a.end_date > DateTime.now }.sort { |a, b| a.begin_date <=> b.begin_date }.first
	end

	def is_happening?
		begin_date <= DateTime.now && end_date >= DateTime.now
	end

	def to_s_compact
		str =
			if begin_date.wday == DateTime.now.wday
				"Hoje"
			elsif begin_date.wday == (DateTime.now + 1.day).wday
				"Amanhã"
			else
				Activity::weekday_to_s(begin_date.wday)
			end
		str << ", às #{begin_date.hour}#{begin_date.min == 0 ? '' : ':' + begin_date.min.to_s}h"
		str << " (#{place})"
	end

	def begin_date_to_s
		"#{Activity::weekday_to_s(begin_date.wday)}, #{begin_date.day} de #{Activity::month_to_s(begin_date.month)}, às #{begin_date.hour}#{begin_date.min == 0 ? '' : ':' + begin_date.min.to_s}h"
	end

	def self.day_to_s(d)
		"#{weekday_to_s(d.wday)}, #{d.day} de #{month_to_s(d.month)}"
	end

	def type_to_s
		case activity_type
		when ActivityType::TALK
			"Talk"
		when ActivityType::WORKSHOP
			"Workshop"
		when ActivityType::LOUNGE
			"Lounge"
		when ActivityType::QUIZ
			"Quiz"
		when ActivityType::CHALLENGE
			"Desafio"
		when ActivityType::HACKATHON
			"Hackathon"
		when ActivityType::SOCIAL
			"Evento Social"
		when ActivityType::SPORT
			"Evento Desportivo"
		when ActivityType::PRESENTATION
			"Apresentação"
		when ActivityType::DISCUSSION
			"Debate"
		when ActivityType::MEET
			"Meet"
		else
			""
		end
	end

	private

	def self.weekday_to_s(wday)
		case wday
		when 1
			"Segunda-feira"
		when 2
			"Terça-feira"
		when 3
			"Quarta-feira"
		when 4
			"Quinta-feira"
		when 5
			"Sexta-feira"
		when 6
			"Sábado"
		when 0
			"Domingo"
		else
			""
		end
	end

	def self.month_to_s(month)
		case month
		when 1
			"Janeiro"
		when 2
			"Fevereiro"
		when 3
			"Março"
		when 4
			"Abril"
		when 5
			"Maio"
		when 6
			"Junho"
		when 7
			"Julho"
		when 8
			"Agosto"
		when 9
			"Setembro"
		when 10
			"Outubro"
		when 11
			"Novembro"
		when 12
			"Dezembro"
		end
	end
end
