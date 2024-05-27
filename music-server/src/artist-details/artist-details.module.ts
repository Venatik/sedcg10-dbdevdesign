import { Module } from '@nestjs/common';
import { ArtistDetailsService } from './artist-details.service';
import { ArtistDetailsController } from './artist-details.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ArtistDetails } from './entities/artist-details.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ArtistDetails])],
  controllers: [ArtistDetailsController],
  providers: [ArtistDetailsService],
})
export class ArtistDetailsModule {}
