import ./tip

const UPPER_LIMIT = 0
const RIGHT_LIMIT = 7
const LEFT_LIMIT = 0
const LOWER_LIMIT = 7

type Board* = seq[seq[Tip]]

func outOfRange(val: int): bool = return val < 0 or 7 < val

proc canUpdateUpper(board: Board, tip: Tip): bool =
  var col = tip.col - 1
  var row = tip.row

  if outOfRange(col): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.dec

  for i in countdown(col, UPPER_LIMIT):
    if board[i][row] == nil: return false
    if board[i][row].color == tip.color: return true

  return false

proc updateUpper(board: Board, tip: Tip): void =
  if not board.canUpdateUpper(tip): return 
  let col = tip.col
  let row = tip.row
  for i in countdown(col - 1, UPPER_LIMIT):
    if board[i][row].color == tip.color: break
    board[i][row].color = tip.color

proc canUpdateRight(board: Board, tip: Tip): bool =
  var col = tip.col
  var row = tip.row + 1

  if outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  row.inc

  for i in countup(row, RIGHT_LIMIT):
    if board[col][i] == nil: return false
    if board[col][i].color == tip.color: return true

  return false

proc updateRight(board: Board, tip: Tip): void =
  if not board.canUpdateRight(tip): return
  let col = tip.col
  let row = tip.row
  for i in countup(row + 1, RIGHT_LIMIT):
    if board[col][i].color == tip.color: break
    board[col][i].color = tip.color

proc canUpdateLeft(board: Board, tip: Tip): bool =
  var col = tip.col
  var row = tip.row - 1

  if outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  row.dec

  for i in countdown(row , LEFT_LIMIT):
    if board[col][i] == nil: return false
    if board[col][i].color == tip.color: return true

  return false

proc updateLeft(board: Board, tip: Tip): void =
  if not board.canUpdateLeft(tip): return
  let col = tip.col
  let row = tip.row
  for i in countdown(row - 1, LEFT_LIMIT):
    if board[col][i].color == tip.color: break
    board[col][i].color = tip.color

proc canUpdateLower(board: Board, tip: Tip): bool =
  var col = tip.col + 1
  var row = tip.row

  if outOfRange(col): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.inc

  for i in countup(col, LOWER_LIMIT):
    if board[i][row] == nil: return false
    if board[i][row].color == tip.color: return true

  return false

proc updateLower(board: Board, tip: Tip): void =
  if not board.canUpdateLower(tip): return
  let col = tip.col
  let row = tip.row
  for i in countup(col + 1, LOWER_LIMIT):
    if board[i][row].color == tip.color: break
    board[i][row].color = tip.color

proc canUpdateUpperRight(board: Board, tip: Tip): bool =
  var col = tip.col - 1
  var row = tip.row + 1

  if outOfRange(col) or outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.dec
  row.inc

  while col >= UPPER_LIMIT and row <= RIGHT_LIMIT:
    if board[col][row] == nil: return false
    if board[col][row].color == tip.color: return true
    col.dec
    row.inc

  return false

proc updateUpperRight(board: Board, tip: Tip): void =
  if not board.canUpdateUpperRight(tip): return
  var col = tip.col
  var row = tip.row

  col.dec
  row.inc

  while col >= UPPER_LIMIT and row <= RIGHT_LIMIT:
    if board[col][row].color == tip.color: break
    board[col][row].color = tip.color
    col.dec
    row.inc

proc canUpdateLowerRight(board: Board, tip: Tip): bool =
  var col = tip.col + 1
  var row = tip.row + 1

  if outOfRange(col) or outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.inc
  row.inc

  while col <= LOWER_LIMIT and row <= RIGHT_LIMIT:
    if board[col][row] == nil: return false
    if board[col][row].color == tip.color: return true
    col.inc
    row.inc

  return false

proc updateLowerRight(board: Board, tip: Tip): void =
  if not board.canUpdateLowerRight(tip): return
  var col = tip.col
  var row = tip.row

  col.inc
  row.inc

  while col <= LOWER_LIMIT and row <= RIGHT_LIMIT:
    if board[col][row].color == tip.color: break
    board[col][row].color = tip.color
    col.inc
    row.inc

proc canUpdateUpperLeft(board: Board, tip: Tip): bool =
  var col = tip.col - 1
  var row = tip.row - 1

  if outOfRange(col) or outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.dec
  row.dec

  while col >= UPPER_LIMIT and row >= LEFT_LIMIT:
    if board[col][row] == nil: return false
    if board[col][row].color == tip.color: return true
    col.dec
    row.dec

  return false

proc updateUpperLeft(board: Board, tip: Tip): void =
  if not board.canUpdateUpperLeft(tip): return
  var col = tip.col
  var row = tip.row

  col.dec
  row.dec

  while col >= UPPER_LIMIT and row >= LEFT_LIMIT:
    if board[col][row].color == tip.color: break
    board[col][row].color = tip.color
    col.dec
    row.dec

proc canUpdateLowerLeft(board: Board, tip: Tip): bool =
  var col = tip.col + 1
  var row = tip.row - 1

  if outOfRange(col) or outOfRange(row): return false
  if board[col][row] == nil: return false
  if board[col][row].color == tip.color: return false

  col.inc
  row.dec

  while col <= LOWER_LIMIT and row >= LEFT_LIMIT:
    if board[col][row] == nil: return false
    if board[col][row].color == tip.color: return true
    col.inc
    row.dec

  return false

proc updateLowerLeft(board: Board, tip: Tip): void =
  if not board.canUpdateLowerLeft(tip): return
  var col = tip.col
  var row = tip.row

  col.inc
  row.dec

  while col <= LOWER_LIMIT and row >= LEFT_LIMIT:
    if board[col][row].color == tip.color: break
    board[col][row].color = tip.color
    col.inc
    row.dec

proc positionIsEmpty(board: Board, tip: Tip): bool =
  return board[tip.col][tip.row] == nil

proc updateBoard*(board: Board, tip: Tip): void =
  board.updateUpper(tip)
  board.updateRight(tip)
  board.updateLeft(tip)
  board.updateLower(tip)
  board.updateUpperRight(tip)
  board.updateLowerRight(tip)
  board.updateUpperLeft(tip)
  board.updateLowerLeft(tip)

proc canPlaceTip*(board: Board, tip: Tip): bool = 
  return board.positionIsEmpty(tip) and(
         board.canUpdateUpper(tip) or
         board.canUpdateRight(tip) or
         board.canUpdateLeft(tip) or
         board.canUpdateLower(tip) or
         board.canUpdateUpperRight(tip) or
         board.canUpdateLowerRight(tip) or
         board.canUpdateUpperLeft(tip) or
         board.canUpdateLowerLeft(tip) )

proc shouldSkip*(board: Board, color: Color): bool = 
  for col, line in board:
    for row, current_tip in line:
      let tip  = if color == Color.Black: newBlackTip(col, row) else: newWhiteTip(col, row)
      if board.canPlaceTip(tip): return false
  return true

proc placeTip*(board: var Board, tip: Tip): void =
  board[tip.col][tip.row] = tip