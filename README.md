# RemcoMath

RemcoMathLib is a **Gas optimized** FullMath implementation inspired by **Remco Bloemen**.

```ml
src
├─ RemcoMathLib — "Gas optimized FullMath Implementation"
```

## Gas Comparison

```ml
╭───────────────────┬─────────────────┬─────┬────────┬─────┬─────────╮
│ FullMath contract ┆                 ┆     ┆        ┆     ┆         │
╞═══════════════════╪═════════════════╪═════╪════════╪═════╪═════════╡
│ Deployment Cost   ┆ Deployment Size ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 74748             ┆ 431             ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name     ┆ min             ┆ avg ┆ median ┆ max ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ mulDiv            ┆ 437             ┆ 588 ┆ 588    ┆ 739 ┆ 2       │
╰───────────────────┴─────────────────┴─────┴────────┴─────┴─────────╯
╭───────────────────────┬─────────────────┬─────┬────────┬─────┬─────────╮
│ RemcoMathLib contract ┆                 ┆     ┆        ┆     ┆         │
╞═══════════════════════╪═════════════════╪═════╪════════╪═════╪═════════╡
│ Deployment Cost       ┆ Deployment Size ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ 67942                 ┆ 397             ┆     ┆        ┆     ┆         │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ Function Name         ┆ min             ┆ avg ┆ median ┆ max ┆ # calls │
├╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┤
│ mulDiv                ┆ 331             ┆ 504 ┆ 504    ┆ 678 ┆ 2       │
╰───────────────────────┴─────────────────┴─────┴────────┴─────┴─────────╯
```

## Installation

To install with [DappTools](https://github.com/dapphub/dapptools):

```
dapp install 0xClandestine/RemcoMath
```

To install with [Foundry](https://github.com/gakonst/foundry):

```
forge install 0xClandestine/RemcoMath
```

## Local development

This project uses [Foundry](https://github.com/gakonst/foundry) as the development framework.

### Dependencies

```
make update
```

### Compilation

```
make build
```

### Testing

```
make test
```


## Acknowledgements

These contracts were inspired by or directly modified from many sources, primarily:

- [Remco Bloemen](https://xn--2-umb.com/21/muldiv/index.html)
