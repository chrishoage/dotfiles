import { parse } from "https://deno.land/std@0.127.0/flags/mod.ts";
import { ensureFileSync } from "https://deno.land/std@0.127.0/fs/mod.ts";
import { resolve } from "https://deno.land/std@0.126.0/path/mod.ts";
import { ColorScheme } from "./types.ts";
import { loadColorScheme } from "./utils.ts";
import * as templates from "../templates/mod.ts";

const args = parse(Deno.args, {
  string: ["scheme"],
  boolean: ["help"],
  alias: {
    scheme: "s",
    help: "h",
  },
  default: {
    _: Deno.cwd(),
  },
  unknown(_arg, key, value) {
    // Allow positional
    if (key == null && value == null) {
      return true;
    }

    return false;
  },
});

function showHelp() {
  console.log(`
polkadots -s scheme.json -t [output directory]

Options:
  -h, --help      this help
  -s, --scheme    the colorscheme to use for templates      [required]

Arguments:
  [output directory]  directory to write template output to [default: ${Deno.cwd()}]
  `);
}

if (args.help) {
  showHelp();
  Deno.exit(0);
}

if (!args.scheme) {
  if (!args.scheme) {
    console.log("Missing argument --scheme");
  }

  showHelp();
  Deno.exit(1);
}

const [outputDirectory = Deno.cwd()] = args._;

if (typeof outputDirectory === "number") {
  throw new Error(`output directory has unexpected value: ${outputDirectory}`);
}

let colorscheme: ColorScheme;

try {
  colorscheme = loadColorScheme(args.scheme);
} catch (error) {
  console.error(`Unable to load color scheme ${args.scheme}`);
  throw error;
}

Object.entries(templates).forEach(([name, template]) => {
  const { filePath, default: generateTemplate } = template;
  const fullPath = resolve(Deno.cwd(), outputDirectory, filePath);

  console.log(`Writing: ${name} to ${fullPath}`);

  ensureFileSync(fullPath);
  Deno.writeTextFileSync(fullPath, generateTemplate(colorscheme).trimStart());
});
