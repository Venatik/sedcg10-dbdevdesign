import { Module } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';
import { SongLyricsController } from './song-lyrics.controller';

@Module({
  controllers: [SongLyricsController],
  providers: [SongLyricsService],
})
export class SongLyricsModule {}
