class IteratorWithPeek
  def initialize(it)
    @it = it
    @cache = nil
  end

  def peek
    return @cache if @cache
    @cache = @it.next_item if hs_nxt
    @cache ? @cache : -1
  end

  def hs_nxt
    @it.has_next
  end

  def nxt_itm
    peek unless @cache
    peeked = @cache
    @cache = nil
    peeked
  end
end
