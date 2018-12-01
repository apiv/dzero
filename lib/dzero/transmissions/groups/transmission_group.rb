module DZero::Transmissions::Groups
  class TransmissionGroup < Base
    # transmission level segments are not preceeded by a group separator
    def to_s
      string = @segments.map(&:to_s).join
      # remove the trailing segment separator, if any
      string.chomp!(::DZero::Constants::SEGMENT_SEPARATOR)
      string
    end
  end
end