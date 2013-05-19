require "version"
require "rspec/core/formatters/progress_formatter"

class Holla < RSpec::Core::Formatters::ProgressFormatter
  class << self
    attr_accessor :voices, :emcee, :messages, :summary_only
  end

  @voices = %w[Agnes Albert Alex Bad\ News Bahh Bells Boing Bruce Bubbles Cellos
              Deranged Fred Good\ News Hysterical Junior Kathy Pipe\ Organ
              Princess Ralph Trinoids Vicki Victoria Whisper Zarvox]

  @emcee = {
    voice: 'Zarvox',
    rate: 180
  }

  @messages = {
    positive: %w[Yes! Dude! Sweet! Nice! Pretty\ much\ the\ best! Yo\ Dawg!],
    negative: %w[No! Dang! Darn! Damn! Fail! Herp\ Derp! Sad\ Panda!],
    indifferent: %w[Meh! Whatever!]
  }

  @summary_only = true

  def start(example_count)
    super
    say 'Here we go!', Holla.emcee[:voice], Holla.emcee[:rate] unless summary_only?
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    super
    say "#{example_count} examples were run in #{duration.round 1} seconds.  #{failure_count} failed and #{pending_count} were pending.", Holla.emcee[:voice], Holla.emcee[:rate]
  end

  def example_passed(example)
    super
    say Holla.messages[:positive].sample unless summary_only?
  end

  def example_failed(example)
    super
    say Holla.messages[:negative].sample unless summary_only?
  end

  def example_pending(example)
    super
    say Holla.messages[:indifferent].sample unless summary_only?
  end

  private

  def say(message, voice = Holla.voices.sample, rate = Random.new.rand(150..500))
    system("say #{message} -v #{voice} -r #{rate}") if can_speak?
  end

  def can_speak?
    @can_speak ||= system('which say > /dev/null')
  end

  def summary_only?
    Holla.summary_only
  end
end

