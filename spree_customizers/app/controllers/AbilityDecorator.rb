class AbilityDecorator
	include CanCan::Ability

	def initialize(user)
		can :read, Customizer
	end
end

Ability.register_ability(AbilityDecorator)