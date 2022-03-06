import { color } from "https://deno.land/x/chroma/index.ts";
import { ColorScheme } from "../polkadots/types.ts";
import { dec } from "../polkadots/utils.ts";

export const filePath = ".config/rofi/colors.rasi";

export default (s: ColorScheme) => {
  return `
* {
  background-alpha: rgba(${
    color(s.background).alpha(dec(s.alpha))
      .rgba()
  });
  foreground: ${s.foreground};
  selected: ${s.color4};
  border-color: ${s.color4};

  active-background: ${s.color2};
  active-foreground: ${s.background};
  normal-background: transparent;
  normal-foreground: @foreground;
  urgent-background: ${s.color1};
  urgent-foreground: @foreground;

  alternate-active-background: @active-background;
  alternate-active-foreground: @active-foreground;
  alternate-normal-background: @normal-background;
  alternate-normal-foreground: @normal-foreground;
  alternate-urgent-background: @urgent-background;
  alternate-urgent-foreground: @urgent-foreground;

  selected-active-background: @selected;
  selected-active-foreground: @active-background;
  selected-normal-background: @selected;
  selected-normal-foreground: ${s.background};
  selected-urgent-background: @selected;
  selected-urgent-foreground: @urgent-background;
}
`;
};
