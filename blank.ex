defprotocol Blank do
    @doc "Returns true if data is considered blank/empty"
#    @fallback_to_any true
    def blank?(data)
end

# 整型永远不为空
defimpl Blank, for: Integer do
    def blank?(_), do: false
end

# 只有空列表是“空”的
defimpl Blank, for: List do
    def blank?([]), do: true
    def blank?(_),  do: false
end

# 只有空map是“空”
defimpl Blank, for: Map do
  # 一定要记住，我们不能匹配 %{} ，因为它能match所有的map。
  # 但是我们能检查它的size是不是0
  # 检查size是很快速的操作
    def blank?(map), do: map_size(map) == 0
end

# 只有false和nil这两个原子被认为是“空”
defimpl Blank, for: Atom do
    def blank?(false), do: true
    def blank?(nil),   do: true
    def blank?(_),     do: false
end

defimpl Blank, for: BitString do
    def blank?(str),    do: byte_size(str) == 0
end

defimpl Blank, for: Any do
    def blank?(_),  do: false
end