import { Module } from '@nestjs/common';
import { ArtistDetailsService } from './artist-details.service';
import { ArtistDetailsController } from './artist-details.controller';

@Module({
  controllers: [ArtistDetailsController],
  providers: [ArtistDetailsService],
})
export class ArtistDetailsModule {}
