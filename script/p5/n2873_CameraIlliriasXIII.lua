-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 604.763245 , 530.501465 , 43.120632 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(588.030,493.990,40.830);]] )
   Camera:MotionSpline_AddSplinePoint( 592.109619 , 534.197632 , 43.020641 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 578.878601 , 536.128845 , 43.040630 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 570.444458 , 537.236084 , 46.343956 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
