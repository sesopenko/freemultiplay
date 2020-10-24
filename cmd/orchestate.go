package cmd

import (
	"github.com/sesopenko/freemultiplay/orchestration"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(orchestrateCmd)
}

var orchestrateCmd = &cobra.Command{
	Use: "orchestrate",
	Short: "Runs the orchestration Web API Service",
	Long: `Runs an http orchestration server for game clients to communicate with.`,
	Run: func(cmd *cobra.Command, args []string) {
		orchestration.Init()
	},
}